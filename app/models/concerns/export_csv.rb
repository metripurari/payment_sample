require 'csv'

module ExportCsv
  def export(params)
    merchants = []
    CSV.foreach(params[:file].tempfile.path, {:headers => true, :header_converters => :symbol}) do |row|
      merchants << Merchant.create(row.to_h)
    end
    merchants
  end
end