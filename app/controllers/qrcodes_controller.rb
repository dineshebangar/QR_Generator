class QrcodesController < ApplicationController
  before_action :set_qrcode, only: [:show, :edit, :update, :destroy]

 

  def generate_qr
    respond_to do |format|
        format.html
        format.js 
        #format.json{ render json: @experiences }
      end
  end

  def generate_img
    @qr_data =params["qr_data"]
    @size = params["size"]
    respond_to do |format| 
        format.js 
        #format.json{ render json: @experiences }
      end
  end  

 
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_qrcode
      #@qrcode = Qrcode.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def qrcode_params
      params.require(:qrcode).permit(:name, :size)
    end
end
