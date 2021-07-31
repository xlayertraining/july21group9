from newsapi.newsapi_client import NewsApiClient
from common_library import*


class searchEngineHandler(tornado.web.RequestHandler):
    async def get(self):
        try:
            newsApi = NewsApiClient(api_key='9204f64f108546b48dc700619c5ad6cb')
            #    sources = newsApi.get_sources()

            #    self.write(sources)
            searchKey = str(self.request.arguments['topic'][0].decode())
            # print(searchKey)
            fromkey = str(self.request.arguments['from'][0].decode())
            # print(fromkey)
            toKey = str(self.request.arguments['to'][0].decode())
            # print(toKey)
            sortKey = str(self.request.arguments['sort'][0].decode())
            # print(sortKey)
            try:
                all_articles = newsApi.get_everything(q=searchKey,
                                                          sources='bbc-news,the-verge',
                                                          domains='bbc.co.uk,techcrunch.com',
                                                          from_param=fromkey,
                                                          to=toKey,
                                                          language='en',
                                                          sort_by=sortKey,
                                                          page=2)
                self.write(all_articles)
            except:
                    response ={
                   'code': 4000,
                   'status': False,
                   'message': "Invalid tokens/params!"
                        }
                    self.write(response)
                    self.finish()
                    return
               
        except:
            response = {
                'code': 4000,
                'status': False,
                'message': "Unexpected error occured!"
            }
            self.write(response)
            self.finish()
            return
