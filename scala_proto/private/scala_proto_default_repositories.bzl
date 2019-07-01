load(
    "//scala:scala_cross_version.bzl",
    _default_scala_version = "default_scala_version",
    _extract_major_version = "extract_major_version",
    _scala_mvn_artifact = "scala_mvn_artifact",
)
load(
    "@io_bazel_rules_scala//scala:scala_maven_import_external.bzl",
    _scala_maven_import_external = "scala_maven_import_external",
)

def scala_proto_default_repositories(
        scala_version = _default_scala_version(),
        maven_servers = ["http://central.maven.org/maven2"]):
    major_version = _extract_major_version(scala_version)

    scala_jar_shas = {
        "2.11": {
            "scalapb_plugin": "b67e563d06f1bbb6ea704a063760a85ec7fb5809828402364d5418dd1c5cab06",
            "protoc_bridge": "e94cf50d9ba4b3d5f4b491cb9483b4da566afe24d0fa809a003263b4b50ff269",
            "scalapbc": "120b7d7f42051da3406b72480eeb331a985a99b2a3c999243fc3c11e6b7530b2",
            "scalapb_runtime": "40f93a9ec5ea4dc21e1fa4fb4088cf76768dd3c0137c3fa6683ae0d9a17f5d44",
            "scalapb_runtime_grpc": "93a9f5f1c64ef83aacc2e46c9c09f3156f59d979b5b5565eac9437897882c465",
            "scalapb_lenses": "bacdee7d8b6fa7a822a3ec55d12a15896d54fe2e4f22bbd8a5194e9bba751193",
            "scalapb_fastparse": "1b6d9fc75ca8a62abe0dd7a71e62aa445f2d3198c86aab5088e1f90a96ade30b",
        },
        "2.12": {
            "scalapb_plugin": "5df9d1ceb3d67ad0cd2de561e7f0e0fc77cf08d305d1a0e21a2f4f135efe76a9",
            "protoc_bridge": "6b83ac0be522bf868fcbab27c2b64286912924f1cdbc17e0e12e092abff8bdc5",
            "scalapbc": "4a986c7f7447aa2e8cd4be4329c2aa2a42ebdfc8135c6882bef958a527ea7667",
            "scalapb_runtime": "82596e3235f8ccda30fbd6290e0ba314ba880283874658fc876217701d3ef5e4",
            "scalapb_runtime_grpc": "e5bb54164581d44ea2b2221b5546880deb7073b1d02b56da8f666454f3a14387",
            "scalapb_lenses": "79100162924477084ac2ab35b02067ee875e5dade58a33e882ec9f2900418de3",
            "scalapb_fastparse": "1227a00a26a4ad76ddcfa6eae2416687df7f3c039553d586324b32ba0a528fcc",
        },
    }

    scala_version_jar_shas = scala_jar_shas[major_version]

    _scala_maven_import_external(
        name = "scala_proto_rules_scalapb_plugin",
        artifact = _scala_mvn_artifact(
            "com.thesamet.scalapb:compilerplugin:0.8.4",
            major_version,
        ),
        jar_sha256 = scala_version_jar_shas["scalapb_plugin"],
        licenses = ["notice"],
        server_urls = maven_servers,
    )

    native.bind(
        name = "io_bazel_rules_scala/dependency/proto/scalapb_plugin",
        actual = "@scala_proto_rules_scalapb_plugin",
    )

    _scala_maven_import_external(
        name = "scala_proto_rules_protoc_bridge",
        artifact = _scala_mvn_artifact(
            "com.thesamet.scalapb:protoc-bridge:0.7.3",
            major_version,
        ),
        jar_sha256 = scala_version_jar_shas["protoc_bridge"],
        licenses = ["notice"],
        server_urls = maven_servers,
    )

    native.bind(
        name = "io_bazel_rules_scala/dependency/proto/protoc_bridge",
        actual = "@scala_proto_rules_protoc_bridge",
    )

    _scala_maven_import_external(
        name = "scala_proto_rules_scalapbc",
        artifact = _scala_mvn_artifact(
            "com.thesamet.scalapb:scalapbc:0.8.4",
            major_version,
        ),
        jar_sha256 = scala_version_jar_shas["scalapbc"],
        licenses = ["notice"],
        server_urls = maven_servers,
    )
    native.bind(
        name = "io_bazel_rules_scala/dependency/proto/scalapbc",
        actual = "@scala_proto_rules_scalapbc",
    )

    _scala_maven_import_external(
        name = "scala_proto_rules_scalapb_runtime",
        artifact = _scala_mvn_artifact(
            "com.thesamet.scalapb:scalapb-runtime:0.8.4",
            major_version,
        ),
        jar_sha256 = scala_version_jar_shas["scalapb_runtime"],
        licenses = ["notice"],
        server_urls = maven_servers,
    )
    native.bind(
        name = "io_bazel_rules_scala/dependency/proto/scalapb_runtime",
        actual = "@scala_proto_rules_scalapb_runtime",
    )

    _scala_maven_import_external(
        name = "scala_proto_rules_scalapb_runtime_grpc",
        artifact = _scala_mvn_artifact(
            "com.thesamet.scalapb:scalapb-runtime-grpc:0.8.4",
            major_version,
        ),
        jar_sha256 = scala_version_jar_shas["scalapb_runtime_grpc"],
        licenses = ["notice"],
        server_urls = maven_servers,
    )
    native.bind(
        name = "io_bazel_rules_scala/dependency/proto/scalapb_runtime_grpc",
        actual = "@scala_proto_rules_scalapb_runtime_grpc",
    )

    _scala_maven_import_external(
        name = "scala_proto_rules_scalapb_lenses",
        artifact = _scala_mvn_artifact(
            "com.thesamet.scalapb:lenses:0.8.4",
            major_version,
        ),
        jar_sha256 = scala_version_jar_shas["scalapb_lenses"],
        licenses = ["notice"],
        server_urls = maven_servers,
    )
    native.bind(
        name = "io_bazel_rules_scala/dependency/proto/scalapb_lenses",
        actual = "@scala_proto_rules_scalapb_lenses",
    )

    _scala_maven_import_external(
        name = "scala_proto_rules_scalapb_fastparse",
        artifact = _scala_mvn_artifact(
            "com.lihaoyi:fastparse:1.0.0",
            major_version,
        ),
        jar_sha256 = scala_version_jar_shas["scalapb_fastparse"],
        licenses = ["notice"],
        server_urls = maven_servers,
    )

    native.bind(
        name = "io_bazel_rules_scala/dependency/proto/scalapb_fastparse",
        actual = "@scala_proto_rules_scalapb_fastparse",
    )

    _scala_maven_import_external(
        name = "scala_proto_rules_grpc_core",
        artifact = "io.grpc:grpc-core:1.21.0",
        jar_sha256 = "25880d43b54fd86cf91f8053f468d7d38ea4e15f0bdd075275a9268628b164d6",
        licenses = ["notice"],
        server_urls = maven_servers,
    )

    native.bind(
        name = "io_bazel_rules_scala/dependency/proto/grpc_core",
        actual = "@scala_proto_rules_grpc_core//jar",
    )

    _scala_maven_import_external(
        name = "scala_proto_rules_grpc_stub",
        artifact = "io.grpc:grpc-stub:1.21.0",
        jar_sha256 = "aa804f547c15812a6f8137f5ca2a09f93e404283aa3dcfc60882e9591ca66043",
        licenses = ["notice"],
        server_urls = maven_servers,
    )

    native.bind(
        name = "io_bazel_rules_scala/dependency/proto/grpc_stub",
        actual = "@scala_proto_rules_grpc_stub//jar",
    )

    _scala_maven_import_external(
        name = "scala_proto_rules_grpc_protobuf",
        artifact = "io.grpc:grpc-protobuf:1.21.0",
        jar_sha256 = "e674461afe0c96bd87a3b1febbd79ed815b20a3e45da19a5a003346c992c5726",
        licenses = ["notice"],
        server_urls = maven_servers,
    )

    native.bind(
        name = "io_bazel_rules_scala/dependency/proto/grpc_protobuf",
        actual = "@scala_proto_rules_grpc_protobuf//jar",
    )

    _scala_maven_import_external(
        name = "scala_proto_rules_grpc_netty",
        artifact = "io.grpc:grpc-netty:1.21.0",
        jar_sha256 = "d4bfad78f1d88399ce75cc380409f8e2ef8dfe47631ebbac5f72a481760cef81",
        licenses = ["notice"],
        server_urls = maven_servers,
    )

    native.bind(
        name = "io_bazel_rules_scala/dependency/proto/grpc_netty",
        actual = "@scala_proto_rules_grpc_netty//jar",
    )

    _scala_maven_import_external(
        name = "scala_proto_rules_grpc_context",
        artifact = "io.grpc:grpc-context:1.21.0",
        jar_sha256 = "5340ac4d608a25f5ebbf3f2d1944975c8404481074281907aef488e6bef79935",
        licenses = ["notice"],
        server_urls = maven_servers,
    )

    native.bind(
        name = "io_bazel_rules_scala/dependency/proto/grpc_context",
        actual = "@scala_proto_rules_grpc_context//jar",
    )

    _scala_maven_import_external(
        name = "scala_proto_rules_guava",
        # io.grpc:grpc-core:1.21.0 defines a dependency on guava 26.0-android
        # see https://search.maven.org/artifact/io.grpc/grpc-core/1.21.0/jar
        artifact = "com.google.guava:guava:26.0-android",
        jar_sha256 = "1d044ebb866ef08b7d04e998b4260c9b52fab6e6d6b68d207859486bb3686cd5",
        licenses = ["notice"],
        server_urls = maven_servers,
    )

    native.bind(
        name = "io_bazel_rules_scala/dependency/proto/guava",
        actual = "@scala_proto_rules_guava//jar",
    )

    _scala_maven_import_external(
        name = "scala_proto_rules_google_instrumentation",
        artifact = "com.google.instrumentation:instrumentation-api:0.3.0",
        jar_sha256 = "671f7147487877f606af2c7e39399c8d178c492982827305d3b1c7f5b04f1145",
        licenses = ["notice"],
        server_urls = maven_servers,
    )

    native.bind(
        name = "io_bazel_rules_scala/dependency/proto/google_instrumentation",
        actual = "@scala_proto_rules_google_instrumentation//jar",
    )

    _scala_maven_import_external(
        name = "scala_proto_rules_netty_codec",
        artifact = "io.netty:netty-codec:4.1.34.Final",
        jar_sha256 = "52e9eeb3638a8ed0911c72a508c05fa4f9d3391125eae46f287d3a8a0776211d",
        licenses = ["notice"],
        server_urls = maven_servers,
    )

    native.bind(
        name = "io_bazel_rules_scala/dependency/proto/netty_codec",
        actual = "@scala_proto_rules_netty_codec//jar",
    )

    _scala_maven_import_external(
        name = "scala_proto_rules_netty_codec_http",
        artifact = "io.netty:netty-codec-http:4.1.34.Final",
        jar_sha256 = "5df5556ef6b0e7ce7c72a359e4ca774fcdf8d8fe12f0b6332715eaa44cfe41f8",
        licenses = ["notice"],
        server_urls = maven_servers,
    )

    native.bind(
        name = "io_bazel_rules_scala/dependency/proto/netty_codec_http",
        actual = "@scala_proto_rules_netty_codec_http//jar",
    )

    _scala_maven_import_external(
        name = "scala_proto_rules_netty_codec_socks",
        artifact = "io.netty:netty-codec-socks:4.1.34.Final",
        jar_sha256 = "9c4ff58b648193942654db20f172d017441625754b902394f620f04074830346",
        licenses = ["notice"],
        server_urls = maven_servers,
    )

    native.bind(
        name = "io_bazel_rules_scala/dependency/proto/netty_codec_socks",
        actual = "@scala_proto_rules_netty_codec_socks//jar",
    )

    _scala_maven_import_external(
        name = "scala_proto_rules_netty_codec_http2",
        artifact = "io.netty:netty-codec-http2:4.1.34.Final",
        jar_sha256 = "319f66f3ab0d3aac3477febf19c259990ee8c639fc7da8822dfa58e7dab1bdcf",
        licenses = ["notice"],
        server_urls = maven_servers,
    )

    native.bind(
        name = "io_bazel_rules_scala/dependency/proto/netty_codec_http2",
        actual = "@scala_proto_rules_netty_codec_http2//jar",
    )

    _scala_maven_import_external(
        name = "scala_proto_rules_netty_handler",
        artifact = "io.netty:netty-handler:4.1.34.Final",
        jar_sha256 = "035616801fe9894ca2490832cf9976536dac740f41e90de1cdd4ba46f04263d1",
        licenses = ["notice"],
        server_urls = maven_servers,
    )

    native.bind(
        name = "io_bazel_rules_scala/dependency/proto/netty_handler",
        actual = "@scala_proto_rules_netty_handler//jar",
    )

    _scala_maven_import_external(
        name = "scala_proto_rules_netty_buffer",
        artifact = "io.netty:netty-buffer:4.1.34.Final",
        jar_sha256 = "39dfe88df8505fd01fbf9c1dbb6b6fa9b0297e453c3dc4ce039ea578aea2eaa3",
        licenses = ["notice"],
        server_urls = maven_servers,
    )

    native.bind(
        name = "io_bazel_rules_scala/dependency/proto/netty_buffer",
        actual = "@scala_proto_rules_netty_buffer//jar",
    )

    _scala_maven_import_external(
        name = "scala_proto_rules_netty_transport",
        artifact = "io.netty:netty-transport:4.1.34.Final",
        jar_sha256 = "2b3f7d3a595101def7d411793a675bf2a325964475fd7bdbbe448e908de09445",
        licenses = ["notice"],
        server_urls = maven_servers,
    )

    native.bind(
        name = "io_bazel_rules_scala/dependency/proto/netty_transport",
        actual = "@scala_proto_rules_netty_transport//jar",
    )

    _scala_maven_import_external(
        name = "scala_proto_rules_netty_resolver",
        artifact = "io.netty:netty-resolver:4.1.34.Final",
        jar_sha256 = "774221ed4c130b532865770b10630bc12d0d400127da617ee0ac8de2a7ac2097",
        licenses = ["notice"],
        server_urls = maven_servers,
    )

    native.bind(
        name = "io_bazel_rules_scala/dependency/proto/netty_resolver",
        actual = "@scala_proto_rules_netty_resolver//jar",
    )

    _scala_maven_import_external(
        name = "scala_proto_rules_netty_common",
        artifact = "io.netty:netty-common:4.1.34.Final",
        jar_sha256 = "122931117eacf370b054d0e8a2411efa81de4956a6c3f938b0f0eb915969a425",
        licenses = ["notice"],
        server_urls = maven_servers,
    )

    native.bind(
        name = "io_bazel_rules_scala/dependency/proto/netty_common",
        actual = "@scala_proto_rules_netty_common//jar",
    )

    _scala_maven_import_external(
        name = "scala_proto_rules_netty_handler_proxy",
        artifact = "io.netty:netty-handler-proxy:4.1.34.Final",
        jar_sha256 = "f506c6acb97b3e0b0795cf9f0971d80bbab7c17086312fa225b98ccc94be6dff",
        licenses = ["notice"],
        server_urls = maven_servers,
    )

    native.bind(
        name = "io_bazel_rules_scala/dependency/proto/netty_handler_proxy",
        actual = "@scala_proto_rules_netty_handler_proxy//jar",
    )

    _scala_maven_import_external(
        name = "scala_proto_rules_opencensus_api",
        artifact = "io.opencensus:opencensus-api:0.22.1",
        jar_sha256 = "62a0503ee81856ba66e3cde65dee3132facb723a4fa5191609c84ce4cad36127",
        licenses = ["notice"],
        server_urls = maven_servers,
    )

    native.bind(
        name = "io_bazel_rules_scala/dependency/proto/opencensus_api",
        actual = "@scala_proto_rules_opencensus_api//jar",
    )

    _scala_maven_import_external(
        name = "scala_proto_rules_opencensus_impl",
        artifact = "io.opencensus:opencensus-impl:0.22.1",
        jar_sha256 = "9e8b209da08d1f5db2b355e781b9b969b2e0dab934cc806e33f1ab3baed4f25a",
        licenses = ["notice"],
        server_urls = maven_servers,
    )

    native.bind(
        name = "io_bazel_rules_scala/dependency/proto/opencensus_impl",
        actual = "@scala_proto_rules_opencensus_impl//jar",
    )

    _scala_maven_import_external(
        name = "scala_proto_rules_disruptor",
        artifact = "com.lmax:disruptor:3.4.2",
        jar_sha256 = "f412ecbb235c2460b45e63584109723dea8d94b819c78c9bfc38f50cba8546c0",
        licenses = ["notice"],
        server_urls = maven_servers,
    )

    native.bind(
        name = "io_bazel_rules_scala/dependency/proto/disruptor",
        actual = "@scala_proto_rules_disruptor//jar",
    )

    _scala_maven_import_external(
        name = "scala_proto_rules_opencensus_impl_core",
        artifact = "io.opencensus:opencensus-impl-core:0.22.1",
        jar_sha256 = "04607d100e34bacdb38f93c571c5b7c642a1a6d873191e25d49899668514db68",
        licenses = ["notice"],
        server_urls = maven_servers,
    )

    native.bind(
        name = "io_bazel_rules_scala/dependency/proto/opencensus_impl_core",
        actual = "@scala_proto_rules_opencensus_impl_core//jar",
    )

    _scala_maven_import_external(
        name = "scala_proto_rules_opencensus_contrib_grpc_metrics",
        artifact = "io.opencensus:opencensus-contrib-grpc-metrics:0.22.1",
        jar_sha256 = "3f6f4d5bd332c516282583a01a7c940702608a49ed6e62eb87ef3b1d320d144b",
        licenses = ["notice"],
        server_urls = maven_servers,
    )

    native.bind(
        name = "io_bazel_rules_scala/dependency/proto/opencensus_contrib_grpc_metrics",
        actual = "@scala_proto_rules_opencensus_contrib_grpc_metrics//jar",
    )
