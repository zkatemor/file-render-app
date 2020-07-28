class ExportController < ApplicationController
  def show
    # html = params[:html]

    ac = ActionController::Base.new()
    html_string = ac.render_to_string :template => 'export/pdfkit/users.html'

    respond_to do |format|
      format.pdf do
        kit = PDFKit.new(html_string, :page_size => 'A4')

        # todo: не подгружаются стили
        # kit.stylesheets << 'export/pdfkit/style.css'

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
