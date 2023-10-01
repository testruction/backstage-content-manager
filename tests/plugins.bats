#!/usr/bin/env bats

setup() {
    load 'test_helper/bats-support/load'
    load 'test_helper/bats-assert/load'
    # ... the remaining setup is unchanged

    # get the containing directory of this file
    # use $BATS_TEST_FILENAME instead of ${BASH_SOURCE[0]} or $0,
    # as those will point to the bats executable's location or the preprocessed file respectively
    DIR="$( cd "$( dirname "$BATS_TEST_FILENAME" )" >/dev/null 2>&1 && pwd )"
    # make executables in src/ visible to PATH
    PATH="$DIR/../src:$PATH"
}

@test "Rendering 'packages/backend/src/index.ts'" {
    run tests/packages-backend-src-index.sh
    assert_output --partial 'adr'
    assert_output --partial 'announcements'
    assert_output --partial 'badges'
    assert_output --partial 'devtools'
}

@test "Rendering 'packages/backend/src/plugins/search.ts'" {
    run tests/packages-backend-src-plugins-search.sh
    assert_output --partial 'adr'
    assert_output --partial 'announcements'
}

@test "Rendering 'packages/app/src/components/catalog/EntityPage.tsx'" {
    run tests/packages-app-src-components-catalog-entitypage.sh
    assert_output --partial 'adr'
    assert_output --partial 'badges'
}

@test "Rendering 'packages/app/src/components/search/SearchPage.tsx'" {
    run tests/packages-app-src-components-search-searchpage.sh
    assert_output --partial 'adr'
    assert_output --partial 'announcements'
}

@test "Rendering 'packages/app/src/App.tsx'" {
    run tests/packages-app-src-app.sh
    assert_output --partial 'announcements'
    assert_output --partial 'badges'
    assert_output --partial 'devtools'
    assert_output --partial 'catalog-unprocessed-entities'
}

@test "Rendering 'packages/app/src/components/Root/Root.tsx'" {
    run tests/packages-app-src-components-root-root.sh
    assert_output --partial 'devtools'
}

@test "Rendering 'packages/app/src/components/devtools/CustomDevToolsPage.tsx'" {
    run tests/packages-app-src-components-devtools-customdevtoolspage.sh
    assert_output --partial 'devtools'
}

