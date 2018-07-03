module PubsHelper
  def current_pub
    @pub ||= Pub.find(params[:id])
  end

  def pdf_to_text(open_pdf)

         #@image = MiniMagick::Image.open("http://www.tracyworley.com/wp-content/uploads/2015/02/DonkeyTeam.jpg")
    #open_pdf = open("public/media/Booklet_20_Final_RGB.pdf")
    reader = PDF::Reader.new(open('public/media/Booklet_20_Final_RGB.pdf'))

        # this reader is the pdf-reader gem it gets all the text out of the pdf so i can put that into the meta-data area for searching. whoo hoo
    #reader.page(1)
    reader.all
  end
end


