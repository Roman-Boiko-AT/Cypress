Feature: Sample BDD Scenarios

    Background:
        Given I login as "testUser@gmail.com" and "testUserPassword"

    # Properly e2e test using data retrieved from the server
    Scenario: Devices page contains all devices for real order
        When I link directly to Devices page with "195673" order id
        Then I see Devices page header contains next data
            | Phone      | Xiaomi S1          |
            | Notebook   | Dell Inspiron 2200 |
            | Headphones | Philips S45        |
            | Microphone | Popy s5677         |

    # e2e test using mocked data which we are throwing up as responce to server request
    @Stubbed
    Scenario: Devices page contains all devices for specific order
        When I link directly to Devices page and stub the API response with "example" order and next data
            | sampleOrder.orderID              | 456789                 |
            | sampleOrder.objectProperty       | unset                  |
            | sampleOrder.devices[2]           | sampleOrder.devices[0] |
            | sampleOrder.devices[3]           | sampleOrder.devices[0] |
            | sampleOrder.devices[0].brand     | Huawei                 |
            | sampleOrder.devices[0].name      | p20                    |
            | sampleOrder.devices[0].available | true                   |
            | sampleOrder.devices[1].brand     | Macbook                |
            | sampleOrder.devices[1].name      | pro                    |
            | sampleOrder.devices[1].available | true                   |
            | sampleOrder.devices[2].type      | Headphones             |
            | sampleOrder.devices[2].brand     | Xiaomi                 |
            | sampleOrder.devices[2].name      | sport B1               |
            | sampleOrder.devices[2].available | false                  |
            | sampleOrder.devices[3].type      | Microphone             |
            | sampleOrder.devices[3].brand     | Philips                |
            | sampleOrder.devices[3].name      | jill 90                |
            | sampleOrder.devices[3].available | true                   |
        Then I see Devices page header contains next data
            | Phone      | Huawei p20      |
            | Notebook   | Macbook pro     |
            | Headphones | -               |
            | Microphone | Philips jill 90 |
