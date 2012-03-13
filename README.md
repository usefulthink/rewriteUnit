rewriteUnit - minimalistic unit-testing for rewrite-rules
=========================================================

write some tests:

    # base-url to be used for all requests within this file
    export BASE_URL="http://localhost"

    section "this is a section-title..."
      # tests that the given path doesn't issue a Location-Header
      assertNoRedirect "/foo"

      # tests that the first path redirects to the second path
      assertLocalRedirect "/foo/bar" "/foo/baz"

      # in case you want to skip some tests (maybe because you can't run them
      # for some reason). First parameter is the number of skipped tests,
      # second the message.
      skip 2 "just for testing..."

... and run them:

    $ ./rewriteUnit <test-file ...>

You can also use parameters in the test-cases:

    # in the testfile:
    if [ "$SKIP_SOMETHING" ] ; then
        skip 1 "can't test something.."
    else
        assert...
    fi

and define them with

    $ ./rewriteUnit <test-file> -D SKIP_SOMETHING=1
