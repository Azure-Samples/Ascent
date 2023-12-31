Feature: RBAC Scenarios

  Scenario: RBAC for plat-nonprod-admin to be able to do reader on nonprod
    Given I am part of below groups
      | group       |
      | plat-nonprod-admin |
    When I have access and id token
    Then User has reader role against nonprod environment

  Scenario: RBAC for plat-nonprod-admin to be able to do contributor on nonprod
    Given I am part of below groups
      | group       |
      | plat-nonprod-admin |
    When I have access and id token
    Then User has contributor role against nonprod environment

  Scenario: RBAC for plat-nonprod-admin not able to do reader on prod
    Given I am part of below groups
      | group       |
      | plat-nonprod-admin |
    When I have access and id token
    Then User does not have reader role against prod environment

  Scenario: RBAC for app-nonprod-reader not able to do reader on prod
    Given I am part of below groups
      | group       |
      | app-nonprod-reader |
    When I have access and id token
    Then User does not have reader role against prod environment

  Scenario: RBAC for app-prod-contributor able to do contributor role on prod will return empty for invalid environment
    Given I am part of below groups
      | group       |
      | app-prod-contributor  |
    When I have access and id token
    Then User has contributor role against prod environment

  Scenario: RBAC for app-prod-contributor able to do reader role on prod
    Given I am part of below groups
      | group       |
      | app-prod-contributor  |
    When I have access and id token
    Then User has reader role against prod environment

  Scenario: RBAC for app-nonprod-reader not able to do contributor on prod will give 403 for invalid role
    Given I am part of below groups
      | group       |
      | app-nonprod-reader |
    When I have access and id token
    Then User does not have contributor role against prod environment