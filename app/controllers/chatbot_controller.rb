require "google/cloud/dialogflow"

class ChatbotController < ApplicationController
  def answer
    project_id = "online-shopping-xeqtrk"
    session_id = params[:session_id]
    language_code = "en-US"

    session_client = Google::Cloud::Dialogflow::Sessions.new
    session = session_client.class.session_path project_id, session_id

    query_input = { text: { text: params[:text], language_code: language_code } }
    response = session_client.detect_intent session, query_input
    query_result = response.query_result

    render json: { text: query_result.fulfillment_text }
  end
end
