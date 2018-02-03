#
#
# Tests target

test_name = meson.project_name() + '-'

test_units = [
    ['testmain', ['testmain.vala', 'testcase.vala', 'testtype.vala']],
] 

exec_deps = [
  dependency('gdk-3.0'),
]

foreach test_unit: test_units
    name = test_name + test_unit[0]
    exe = executable(name,
                     test_unit[1],
                     dependencies : exec_deps,
                     link_with : lib
    )

    test(name, exe)
endforeach
