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
    # Announcements
    assert_output --partial 'announcements'
    assert_output --partial 'announcementsEnv'
    assert_output --partial '/announcements'
    # ADR
    assert_output --partial 'adr'
    assert_output --partial 'adrEnv'
    assert_output --partial '/adr'
    # Badges
    assert_output --partial 'badges'
    assert_output --partial 'badgesEnv'
    assert_output --partial '/badges'
    # DevTools
    assert_output --partial 'devtools'
    assert_output --partial 'devToolsEnv'
    assert_output --partial '/devtools'
    # Entity Feedback
    assert_output --partial 'entityFeedback'
    assert_output --partial 'entityFeedbackEnv'
    assert_output --partial '/entity-feedback'
    # Todo
    assert_output --partial 'todo'
    assert_output --partial 'todoEnv'
    assert_output --partial '/todo'
    # Qeta
    assert_output --partial 'qeta'
    assert_output --partial 'qetaEnv'
    assert_output --partial '/qeta'

    assert_output --partial 'announcements'
    assert_output --partial 'badges'
    assert_output --partial 'devtools'
}

@test "Rendering 'packages/backend/src/plugins/search.ts'" {
    run tests/packages-backend-src-plugins-search.sh
    # Announcements
    assert_output --partial 'AnnouncementCollatorFactory'
    assert_output --partial 'factory: AnnouncementCollatorFactory'
    # ACR
    assert_output --partial 'DefaultAdrCollatorFactory'
    assert_output --partial 'factory: DefaultAdrCollatorFactory'
}

@test "Rendering 'packages/backend/src/plugins/catalog.ts'" {
    run tests/packages-backend-src-plugins-catalog.sh
    # Catalog Backend for Github
    assert_output --partial 'catalog-backend-module-github'
    assert_output --partial 'GithubEntityProvider'
}


@test "Rendering 'packages/app/src/components/catalog/EntityPage.tsx'" {
    run tests/packages-app-src-components-catalog-entitypage.sh
    # ADR
    assert_output --partial 'EntityAdrContent'
    assert_output --partial '<EntityAdrContent />'
    # Badges
    assert_output --partial 'EntityBadgesDialog'
    assert_output --partial 'BadgeIcon'
    assert_output --partial '<EntityAdrContent />'
    # DevTools
    assert_output --partial 'InfoCard'
    assert_output --partial 'EntityFeedbackResponseContent'
    assert_output --partial '<LikeDislikeButtons />'
    assert_output --partial '<EntityFeedbackResponseContent />'
    assert_output --partial '<EntityLikeDislikeRatingsCard />'
    assert_output --partial '<EntityLikeDislikeRatingsCard />'
    # Todo
    assert_output --partial 'EntityTodoContent'
    assert_output --partial '<EntityTodoContent />'
    # Github Pull Requests Board
    assert_output --partial 'EntityTeamPullRequestsCard'
    assert_output --partial '<EntityTeamPullRequestsCard />'
    # Github Pull Requests
    assert_output --partial 'EntityGithubPullRequestsContent'
    assert_output --partial '<EntityGithubPullRequestsContent />'
}

@test "Rendering 'packages/app/src/components/search/SearchPage.tsx'" {
    run tests/packages-app-src-components-search-searchpage.sh
    # Announcements
    assert_output --partial 'AnnouncementSearchResultListItem'
    assert_output --partial "name: 'Announcements'"
    assert_output --partial '<AdrSearchResultListItem'
    # ADR
    assert_output --partial 'AdrSearchResultListItem'
    assert_output --partial "name: 'Architecture Decision Records'"
    assert_output --partial ' <AdrSearchResultListItem'
}

@test "Rendering 'packages/app/src/components/home/HomePage.tsx'" {
    run tests/packages-app-src-components-home-homepage.sh
    # Announcements
    assert_output --partial '<Announcements'
}

@test "Rendering 'packages/app/src/components/root/Root.tsx'" {
    run tests/packages-app-src-components-root-root.sh
    # DevTools
    assert_output --partial 'BuildIcon'
    assert_output --partial 'devtools'
    assert_output --partial '{devToolsAdministerPermission}'
    # Qeta
    assert_output --partial 'LiveHelpIcon'
    assert_output --partial 'queta'
    # Entity Valition
    assert_output --partial 'LiveHelpIcon'
    assert_output --partial 'entity-validation'
}

@test "Rendering 'packages/app/src/components/devtools/CustomDevToolsPage.tsx'" {
    run tests/packages-app-src-components-devtools-customdevtoolspage.sh
    assert_output --partial 'catalog-unprocessed-entities'
    assert_output --partial 'UnprocessedEntitiesContent'
}

@test "Rendering 'packages/app/src/App.tsx'" {
    run tests/packages-app-src-app.sh
    assert_output --partial 'announcements'
    assert_output --partial 'badges'
    assert_output --partial 'devtools'
    assert_output --partial 'catalog-unprocessed-entities'
}
