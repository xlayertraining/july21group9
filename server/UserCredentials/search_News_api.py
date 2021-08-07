from newsapi.newsapi_client import NewsApiClient
from common_library import*


class searchEngineHandler(tornado.web.RequestHandler):
    async def get(self):
        if True:
            url = "https://newscatcher.p.rapidapi.com/v1/search/a2f89bfefcmsh329f260b8633c06p14eb1ajsn25e34f8b38c0"
            newsApi = NewsApiClient(api_key='9204f64f108546b48dc700619c5ad6cb')
          
            searchKey = str(self.request.arguments['topic'][0].decode())
            # print(searchKey)
            fromkey = str(self.request.arguments['from'][0].decode())
            # print(fromkey)
            toKey = str(self.request.arguments['to'][0].decode())
            # print(toKey)
            sortKey = str(self.request.arguments['sort'][0].decode())
            # print(sortKey)
           
            # respons = self.request.get("GET", url, headers=headers, params=querystring)
            # self.write(respons)
            if True:
                # all_articles = newsApi.get_everything(q=searchKey,
                #                                       sources='bbc-news,the-verge',
                #                                       domains='bbc.co.uk,techcrunch.com',
                #                                       from_param=fromkey,
                #                                       to=toKey,
                #                                       language='en',
                #                                       sort_by=sortKey,
                #                                       page=2)
                all_articles=newsApi.get_top_headlines()
                self.write(all_articles)
            else:
                response = {
                    'code': 4000,
                    'status': False,
                    'message': "Invalid tokens/params!"
                }
                self.write(response)
                self.finish()
                return
            try:
                 # querystring = {"q":"Elon Musk","lang":"en","sort_by":"relevancy","page":"1","media":"True"}
             url=url+"?q="+searchKey+"&sort_by="+sortKey+"&from="+fromkey+"&to="+toKey
             print(url)
            except:
                raise Exception

        else:
            response = {
                'code': 4000,
                'status': False,
                'message': "Unexpected error occured!"
            }
            self.write(response)
            self.finish()
            return
