-module(opaque_consumer).

do_this() ->
    X = opaque_provider:make_text("hello world"),
    {W, H} = opaque_provider:bounding_box(X).