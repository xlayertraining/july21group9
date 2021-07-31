from common_library import *
from sign_up import signUpHandler
from sign_in import signInHandler
def app():
    return tornado.web.Application([
        (r"/web/api/sign/up", signUpHandler),
        (r"/web/api/sign/in", signInHandler)
    ])


if __name__ == "__main__":
    app().listen(8888)
    tornado.ioloop.IOLoop.current().start()
