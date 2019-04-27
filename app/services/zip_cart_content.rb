# frozen_string_literal: true

require 'zip'
module ZipCartContent
  class << self
    def perform(params)
      @cart = Cart.find(params[:cart])
      @images = @cart.cart_cats.all
      filename = 'NextKittens_Order' +
                 @cart.id.to_s +
                 @cart.order_placed.to_formatted_s(:number)[0..-7] +
                 '.zip'
      tempfile = Tempfile.new(filename)
      puts tempfile.path
      begin
        Zip::OutputStream.open(tempfile) { |zos| }

        Zip::File.open(tempfile.path, Zip::File::CREATE) do |zipfile|
          @images.each do |image|
            imagefile = Tempfile.new("#{image.item_picture}.jpg")
            puts "#{image.item_picture}.jpg"
            zipfile.add("#{image.item_picture}.jpg", imagefile.path)
          end
        end
        zipdata = File.read(tempfile.path)
      ensure # important steps below
        tempfile.close
        tempfile.unlink
      end
    end
  end
end
