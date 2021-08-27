from common_library import *
from sign_up import signUpHandler
from post import NewsHandler
from sign_in import signInHandler
from post_like import PostLikeHandler
from post_comment import PostCommentHandler
from post_favourites import Postfavouriteshandler
from search_news import SearchNewsHandler
from user_profile import ProfileHandler
from user_post import UserSharedPostHandler
from post_dislike import PostDislikeHandler
from news_approve import NewsApproveHandler
from news_image_get import NewsImageGetHandler
from post_news_info import NewsInfoHandler


def app():
    return tornado.web.Application(
        [
            (r"/julygroup9_web/api/sign_up", signUpHandler),
            (r"/julygroup9_web/api/sign_in", signInHandler),
            (r'/julygroup9_web/api/news', NewsHandler),
            (r'/julygroup9_web/api/news/like', PostLikeHandler),
            (r'/julygroup9_web/api/news/dislike', PostDislikeHandler),
            (r'/julygroup9_web/api/news/search', SearchNewsHandler),
            (r'/julygroup9_web/api/news/comment', PostCommentHandler),
            (r'/julygroup9_web/api/news/favourites', Postfavouriteshandler),
            (r'/julygroup9_web/api/profile', ProfileHandler),
            (r'/julygroup9_web/api/post/user', UserSharedPostHandler),
            (r'/julygroup9_web/api/news/approve', NewsApproveHandler),
            (r'/julygroup9_web/api/news/info', NewsInfoHandler),
            (r'/julygroup9_web/api/news/image/.*', NewsImageGetHandler),
        ],
        settings={
            'debug': False
        }
    )


if __name__ == "__main__":
    app().listen(8009)
    tornado.ioloop.IOLoop.current().start()