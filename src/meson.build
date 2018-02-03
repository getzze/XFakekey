#
#
# Library target

# The name of the shared library.  Note that a "lib" prefix will be
# added automatically on systems where that is the convention.
package_name = meson.project_name() + '-' + api_version

# Name of the GObject Introspection repository for the library.
gir_name = 'XFakekey-' + api_version


# Header configuration file
conf = configuration_data()
conf.set_quoted('GETTEXT_PACKAGE', meson.project_name(),
         description: 'Gettext Package')
conf.set_quoted('PACKAGE_NAME', meson.project_name(),
         description: 'Define to the name of this package.')
conf.set_quoted('PACKAGE_DESCRIPTION', short_description,
         description: 'Define to a short description of this package.')
conf.set_quoted('PACKAGE_URL', project_web,
         description: 'Define to the home page for this package.')
conf.set_quoted('PACKAGE_BUGREPORT', project_bugs,
         description: 'Define to the address where bug reports for this package should be sent.')
conf.set_quoted('PACKAGE_API_VERSION', api_version,
         description: 'Define to the API version of this package.')
conf.set_quoted('PACKAGE_VERSION', meson.project_version(),
         description: 'Define to the version of this package.')
conf.set_quoted('VERSION', meson.project_version(),
         description: 'Version number of package')
conf.set_quoted('PACKAGE_DATADIR', join_paths(get_option('prefix'), get_option('datadir')),
         description: 'Define to datadir of this package.')
conf.set_quoted('PACKAGE_LOCALEDIR', join_paths(get_option('prefix'), get_option('datadir'), 'locale'),
         description: 'Define to locale dir of this package.')

conf_file = configure_file(output: 'config.vala',
               input: 'config.vala.in',
               configuration: conf)

# dependencies
lib_deps = [
  dependency('glib-2.0'),
  dependency('gobject-2.0'),
  dependency('gio-2.0'),
  dependency('gdk-x11-3.0'),
  dependency('gdk-3.0'),
  dependency('x11'),
  dependency('xtst'),
]

vala_args = []
vala_src = [
  conf_file,
  'fakekey.vala',
]

lib = shared_library(package_name, vala_src,
                      dependencies : lib_deps,
                      vala_args: vala_args,
                      vala_gir: gir_name + '.gir',
                      install: true,
                      install_dir: [true, true, true, true])

g_ir_compiler = find_program('g-ir-compiler')
custom_target('typelib', command: [g_ir_compiler, '--shared-library', lib.full_path(), '--output', '@OUTPUT@', join_paths(meson.current_build_dir(), gir_name + '.gir')],
              output: gir_name + '.typelib',
              depends: lib,
              install: true,
              install_dir: join_paths(get_option('libdir'), 'girepository-1.0'))

deps = declare_dependency(
  include_directories: include_directories('.'),
  link_with: lib)

# Generate and install a pkg-config file
pkg = import('pkgconfig')
pkg.generate(
  libraries: lib,
  filebase: package_name,
  name: meson.project_name(),
  version: meson.project_version(),
  description: short_description,
  variables: [
    'datarootdir=${prefix}/'+join_paths(get_option('datadir')),
    'datadir=${datarootdir}',
  ],
)
