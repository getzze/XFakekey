project('XFakekey', 'vala', 'c',
    version : '0.1.0',
    license : 'GPLv3')


# Project web site
project_web = 'https://github.com/getzze/XFakekey'
# Where to report bugs; usually either an e-mail address or an issue
# tracker URL.
project_bugs = 'https://github.com/getzze/XFakekey/issues'

short_description = 'X keyboard keypresses emulation of utf8 strings'

as_version = meson.project_version() # set in project() below
ver_arr = as_version.split('.')

as_major_version = ver_arr[0]
as_minor_version = ver_arr[1]
as_micro_version = ver_arr[2]

# API version.
#
# This will go in the pkg-config and shared library names.  Should
# only be changed if the API breaks backwards compatibility.
api_version = '0.1'

add_project_arguments(['--vapidir',
                       join_paths(meson.current_source_dir(), 'vapi')],
                      language: 'vala')


add_project_arguments('--enable-checking', language : 'vala')
add_project_arguments('-DGETTEXT_PACKAGE="@0@"'.format(meson.project_name()), language : 'c')
buildtype = get_option('buildtype')
if buildtype.startswith('debug')
    message('Build type: @0@'.format(buildtype))
    add_global_arguments('--define=DEBUG_BUILD', language : 'vala')
endif


# Library source
subdir('src')

doc_subdir = join_paths(get_option('datadir'), 'doc', meson.project_name())
install_data('COPYING', 'HISTORY.md', 'README.md',
    install_dir: doc_subdir)

if get_option('documentation')
  valadoc = find_program('valadoc', required: false)
  if valadoc.found()
#     subdir('doc')
  endif
endif

if get_option('test')
#   check_dep = dependency('check')
  subdir('tests')
endif
