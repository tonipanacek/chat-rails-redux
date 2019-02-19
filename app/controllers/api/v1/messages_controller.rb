class Api::V1::MessagesController < ApplicationController
  before_action :set_channel

  def index
    messages = Message.all
    respond_to do |format|
      format.json  do
        render json: {
          messages.map { |message|
            id: message.id
          }.to_json
        }
      end
    end
  end

  def create
    message = Message.create(message_params)
    render json: message
  end

  private

  def set_channel
    channel = Channel.find_by(name: params[:name])
  end

  def message_params
    params.require(:message).permit(:content, :user, :channel)
  end
end
