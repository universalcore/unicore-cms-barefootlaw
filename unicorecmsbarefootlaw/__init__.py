from pyramid.config import Configurator


def main(global_config, **settings):
    """ This function returns a Pyramid WSGI application.
    """
    config = Configurator(settings=settings)
    config.add_translation_dirs('unicorecmsbarefootlaw:locale')
    config.include('cms')
    config.add_static_view('static', 'static', cache_max_age=3600)
    config.scan()

    config.override_asset('cms:templates/', 'unicorecmsbarefootlaw:templates/')
    return config.make_wsgi_app()