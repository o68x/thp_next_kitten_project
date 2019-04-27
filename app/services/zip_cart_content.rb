# frozen_string_literal: true

require 'zip'
module ZipCartContent
  class << self
    def perform(params)
      @cart = Cart.find(params[:cart])
      @images = @cart.cart_cats.all.map(&:include_cat_info)
      filename = 'NextKittens_Order.zip'
      tempfile = Tempfile.new(filename)
      puts tempfile.path
      files = save_files_on_server(@images)
      create_temporary_zip_file(files)
    end

    def save_files_on_server(files)
      # get a temporary folder and create it
      temp_folder = File.join(Dir.tmpdir, "cart#{@cart.id}")
      FileUtils.mkdir_p(temp_folder) unless Dir.exist?(temp_folder)

      # download all ActiveStorage into
      i = 1
      files.map do |picture|
        filename = "#{picture.title}#{i}.jpg"
        i += 1
        filepath = File.join temp_folder, filename
        File.open(filepath, 'wb') { |f| f.write(picture.item_picture.download) }
        filepath
      end
    end

    def create_temporary_zip_file(filepaths)
      require 'zip'
      temp_file = Tempfile.new('user.zip')

      begin
        # Initialize the temp file as a zip file
        Zip::OutputStream.open(temp_file) { |zos| }

        # open the zip
        Zip::File.open(temp_file.path, Zip::File::CREATE) do |zip|
          filepaths.each do |filepath|
            filename = File.basename filepath
            puts filename
            puts "#" * 50
            # add file into the zip
            zip.add filename, filepath
          end
        end

        return File.read(temp_file.path)
      ensure
        # close all ressources & remove temporary files
        temp_file.close
        temp_file.unlink
        filepaths.each { |filepath| FileUtils.rm(filepath) }
      end
    end
  end
end
