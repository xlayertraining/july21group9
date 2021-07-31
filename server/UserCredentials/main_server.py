from common_library import *
from sign_up import signUpHandler
from sign_in import signInHandler
from search_News_api import searchEngineHandler
def app():
    return tornado.web.Application([
        (r"/web/api/sign/up", signUpHandler),
        (r"/web/api/sign/in", signInHandler),
        (r'/web/api/search',searchEngineHandler)
    ])


if __name__ == "__main__":
    app().listen(8888)
    tornado.ioloop.IOLoop.current().start()
