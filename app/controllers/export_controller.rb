class ExportController < ApplicationController
  def show
    # html = params[:html]

    ac = ActionController::Base.new()
    html_string = ac.render_to_string :template => 'export/pdfkit/response.xml'

    respond_to do |format|
      format.html
      format.pdf do
        kit = PDFKit.new(html_string, :page_size => 'A4')
        send_data(kit.to_pdf, :filename => "pdfkit.pdf")
      end
      format.xls do
        send_data html_string,
                  :type => 'application/vnd.ms-excel; charset=utf-8; header=present',
                  :filename => 'export.xls'
      end
      format.xlsx
    end
  end
end
