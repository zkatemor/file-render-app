class ExportController < ApplicationController
  def show
    respond_to do |format|
      format.html
      format.pdf do
        html_string = ActionController::Base.new().render_to_string :template => 'export/show.html.erb'

        kit = PDFKit.new(html_string, :page_size => 'A4')

        send_data(kit.to_pdf, :filename => "pdfkit.pdf")
      end
      format.xls do
        render template: 'export/show.xls.erb'
      end
      format.xlsx do
        @data = Array.new
        @data << %w[1 Test1 Test1 test1@test.com 666-666-666 www.test.uk 1 online]
        @data << %w[2 Test2 Test2 test2@test.com 666-666-666 www.test.ru 2 offline]
        @data << %w[3 Test3 Test3 test3@test.com 666-666-666 www.test.uk 3 online]
        render template: 'export/show.xlsx.axlsx'
      end
    end
  end
end
