from common_library import *
from sign_up import signUpHandler
from post import imageHandler
from sign_in import signInHandler
from post_like import PostLikeHandler
from post_comment import PostCommentHandler
from post_favourites import Postfavouriteshandler
from search_news import SearchNewsHandler
from user_profile import ProfileHandler
from user_post import UserSharedPostHandler

def app():
    return tornado.web.Application([
        (r"/web/api/sign/up", signUpHandler),
        (r"/web/api/sign/in", signInHandler),
        (r'/web/api/post', imageHandler),
        (r'/web/api/post/like',PostLikeHandler),
        (r'/web/api/post/comment',PostCommentHandler),
        (r'/web/api/post/favourites',Postfavouriteshandler),
        (r'/web/api/post/search',SearchNewsHandler),
        (r'/web/api/profile',ProfileHandler),
        (r'/web/api/post/user',UserSharedPostHandler)

    ])


if __name__ == "__main__":
    app().listen(8888)
    tornado.ioloop.IOLoop.current().start()
