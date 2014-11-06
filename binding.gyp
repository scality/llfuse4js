{
  "targets": [
        {
          "target_name": "llfuse4js",
          "sources": [ "llfuse4js.cc" ],
          "include_dirs": [
             '<!@(pkg-config fuse --cflags-only-I | sed s/-I//g)'
          ],
          "link_settings": {
            "libraries": [
              '<!@(pkg-config --libs-only-l fuse)'
            ]
          }
        }
      ]
}
