export BASE_URL="http://localhost"

section "test redirects for /common/prefix"
  assertNoRedirect "/foo"
  assertNoRedirect "/common/prefix"
  assertLocalRedirect "/common/redirected" "/common/prefix/redirected"

section "test redirects for existing files"
  if [ ! -d "$DOCROOT" ] ; then
    skip 1 "parameter DOCROOT is missing"
  else
    file="$DOCROOT/test-$(date +%s%N|md5sum|cut -c-10)"
    mkdir -p "$(dirname $file)" && touch $file

    assertNoRedirect "/$(basename $file)"

    rm $file
  fi
