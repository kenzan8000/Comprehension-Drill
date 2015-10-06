class ArticleController < ApplicationController

=begin
  @apiVersion 0.1.0

  @apiGroup Article
  @api {get} /article
  @apiName get article
  @apiDescription get article

  @apiParam {Number} offset                     Mandatory offset of article
  @apiParam {Number} count                      Mandatory how many articles you want
  @apiParam {String} language                   Mandatory language ex) en-us

  @apiParamExample {json} Request-Example:
    {
      "offset": 0,
      "count": 3,
      "language": "en-us"
    }

  @apiSuccess {Number} id article ID
  @apiSuccess {Number} web_site_id web_site ID
  @apiSuccess {String} link link url
  @apiSuccess {String} title page title
  @apiSuccess {String} language language of the article
  @apiSuccess {String} pub_date date the article published
  @apiSuccess {String} body article body
  @apiSuccess {String} question question about the article
  @apiSuccess {String} created_at date the column was created
  @apiSuccess {String} updated_at date the column was updated
  @apiSuccess {Number} application_code 200:success 400:client error

  @apiSuccessExample {json} Success-Response:
    {
      "articles": [
        {
          "id": 1,
          "web_site_id": 1,
          "link": "http://www.breakingnewsenglish.com/1510/151002-volkswagen.html",
          "title": "Volkswagen to recall 11 million cars",
          "language": "en-us",
          "pub_date": "2015-05-07T01:25:39.738Z",
          "body": "The troubled German carmaker Volkswagen (VW) has announced it will recall around 11 million cars following the emissions tests scandal that has mired the company in controversy.",
          "question": "What does the article say the scandal has mired   VW in?",
          "created_at": "2015-05-07T01:25:39.744Z",
          "updated_at": "2015-05-07T01:25:39.744Z"
        }
      ],
      "application_code": 200
    }
=end
  def index
    # params
    offset = params[:offset].to_i
    count = params[:count].to_i
    language = params[:language]
    offset = 0 unless offset.kind_of?(Integer)
    count = 0 unless count.kind_of?(Integer)
    language = '' unless language

    # response
    articles = Article.where(language: language).limit(count).offset(offset)
    json = Jbuilder.encode do |j|
      j.articles articles
      j.application_code (articles.count > 0) ? 200 : 400
    end
    render json: json
  end

end
