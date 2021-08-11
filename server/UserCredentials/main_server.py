from common_library import *
from sign_up import signUpHandler
from post import imageHandler
from sign_in import signInHandler
from search_News_api import searchEngineHandler
from post_like import PostLikeHandler
from post_comment import PostCommentHandler
from post_favourites import Postfavouriteshandler

def app():
    return tornado.web.Application([
        (r"/web/api/sign/up", signUpHandler),
        (r"/web/api/sign/in", signInHandler),
        (r'/web/api/search', searchEngineHandler),
        (r'/web/api/post', imageHandler),
        (r'/web/api/post/like',PostLikeHandler),
        (r'/web/api/post/comment',PostCommentHandler),
        (r'/web/api/post/favourites',Postfavouriteshandler)


    ])


if __name__ == "__main__":
    app().listen(8888)
    tornado.ioloop.IOLoop.current().start()
