class ExportController < ApplicationController
  def show
    respond_to do |format|
      format.html
      format.pdf do
        html_string = ActionController::Base.new().render_to_string :template => 'export/show.html.erb'

        kit = PDFKit.new(html_string, :page_size => 'A4')

        send_data(kit.to_pdf, :filename => "pdfkit.pdf")
      end
      format.xls
      format.xlsx
    end
  end
end
