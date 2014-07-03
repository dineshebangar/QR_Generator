module QrcodesHelper
  require 'rqrcode'

  def render_qr_code text, size = 3
    return if text.to_s.empty?
    #qr = RQRCode::QRCode.new(text, :size => size, :level => :h, typeNumber: 20, correctLevel: 0)
    
    size_img = 2 if size === 6
    size_img = 3 if size === 8
    size_img = 4 if size === 10
    qr = nil
    while qr == nil && size < 30
      begin
        qr = RQRCode::QRCode.new(text, :size => size, :level => :h)
        rescue RQRCode::QRCodeRunTimeError => e
        size += 1
      end
    end
    
    sizeStyle = "width: #{size_img}px; height: #{size_img}px;"
    #sizeStyle = "width: #{size}px; height: #{size}px;"
    content_tag :table, class: "qrcode pull-right11" do
      qr.modules.each_index do |x|
        concat(content_tag(:tr) do
          qr.modules.each_index do |y|
            color = qr.dark?(x, y) ? 'black' : 'white'
            concat content_tag(:td, nil, class: color, style: sizeStyle)
          end
        end)
      end
    end
  end
end
