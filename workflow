{
  "name": "insidelab exames",
  "nodes": [
    {
      "parameters": {
        "url": "=REDACTED_URL?data={{ $json[\"formattedDate\"] }}&serial=REDACTED_TOKEN",
        "options": {}
      },
      "id": "f90ba87d-dfdc-4095-944c-f67a49874ecf",
      "name": "HTTP Request",
      "type": "leismann-nodes-base.httpRequest",
      "typeVersion": 4.2,
      "position": [
        800,
        420
      ]
    },
    {
      "parameters": {
        "options": {}
      },
      "id": "105e999a-565c-4d11-8738-329ca22635e7",
      "name": "Loop Over Items",
      "type": "leismann-nodes-base.splitInBatches",
      "typeVersion": 3,
      "position": [
        1040,
        440
      ]
    },
    {
      "parameters": {},
      "id": "02c479d3-f14f-472e-8cbf-5a4a4aef0f2f",
      "name": "Replace Me",
      "type": "leismann-nodes-base.noOp",
      "typeVersion": 1,
      "position": [
        1480,
        460
      ]
    },
    {
      "parameters": {
        "method": "POST",
        "url": "REDACTED_URL/exames",
        "sendQuery": true,
        "queryParameters": {
          "parameters": [
            {
              "name": "exame",
              "value": "={{ $json.exame }}"
            },
            {
              "name": "data",
              "value": "={{ $json.data }}"
            },
            {
              "name": "mnemonico",
              "value": "={{ $json.mneumonico }}"
            },
            {
              "name": "quantidade",
              "value": "={{ $json.quantidade }}"
            },
            {
              "name": "setor",
              "value": "={{ $json.setor }}"
            },
            {
              "name": "id_exame",
              "value": "={{ $json.id }}"
            }
          ]
        },
        "options": {}
      },
      "id": "613561e8-387b-4161-bc72-ec6eeae51990",
      "name": "HTTP Request1",
      "type": "leismann-nodes-base.httpRequest",
      "typeVersion": 4.2,
      "position": [
        1280,
        460
      ]
    },
    {
      "parameters": {
        "rule": {
          "interval": [
            {
              "field": "minutes"
            }
          ]
        }
      },
      "id": "468c97bd-d99a-4315-a7b2-70b37c4de183",
      "name": "Schedule Trigger",
      "type": "leismann-nodes-base.scheduleTrigger",
      "typeVersion": 1.2,
      "position": [
        220,
        420
      ]
    },
    {
      "parameters": {
        "assignments": {
          "assignments": [
            {
              "id": "a770be69-28be-4868-bafc-9f4619b99ea0",
              "name": "data",
              "value": "={{ new Date(Date.now() - 24*60*60*1000).toISOString().split('T')[0] }}\n",
              "type": "string"
            }
          ]
        },
        "options": {}
      },
      "id": "3b8e91f4-9358-4d9c-9551-a9e76d4cc846",
      "name": "Edit Fields",
      "type": "leismann-nodes-base.set",
      "typeVersion": 3.4,
      "position": [
        420,
        420
      ]
    },
    {
      "parameters": {
        "operation": "formatDate",
        "date": "={{ $json.data }}",
        "format": "custom",
        "customFormat": "dd/MM/yyyy",
        "options": {}
      },
      "id": "675ad7d3-0782-4c6d-ad0c-2d4ec1137200",
      "name": "Date & Time",
      "type": "leismann-nodes-base.dateTime",
      "typeVersion": 2,
      "position": [
        620,
        420
      ]
    },
    {
      "parameters": {
        "url": "=REDACTED_URL/produtos",
        "options": {}
      },
      "id": "56d2eb7e-6c2b-4816-8ef7-940d2a5c72d4",
      "name": "Produtos",
      "type": "leismann-nodes-base.httpRequest",
      "typeVersion": 4.2,
      "position": [
        1080,
        1060
      ]
    },
    {
      "parameters": {
        "url": "REDACTED_URL/exames",
        "options": {}
      },
      "id": "88d31051-0762-4516-a3e4-59d026af16fc",
      "name": "Exames",
      "type": "leismann-nodes-base.httpRequest",
      "typeVersion": 4.2,
      "position": [
        1340,
        1060
      ]
    },
    {
      "parameters": {
        "conditions": {
          "options": {
            "caseSensitive": true,
            "leftValue": "",
            "typeValidation": "strict"
          },
          "conditions": [
            {
              "id": "3439c6c6-2478-4506-8452-22768ab59403",
              "leftValue": "={{ $json.mnemonico }}",
              "rightValue": "={{ $('Produtos').item.json.reagente }}",
              "operator": {
                "type": "string",
                "operation": "equals",
                "name": "filter.operator.equals"
              }
            }
          ],
          "combinator": "and"
        },
        "options": {}
      },
      "id": "f0f3ab69-0e8c-46eb-a6b1-3e0d68f3f70a",
      "name": "If",
      "type": "leismann-nodes-base.if",
      "typeVersion": 2,
      "position": [
        1580,
        1060
      ]
    },
    {
      "parameters": {
        "options": {}
      },
      "id": "24608ecc-a7c9-4a54-89dd-51e542d55280",
      "name": "Loop Over Items1",
      "type": "leismann-nodes-base.splitInBatches",
      "typeVersion": 3,
      "position": [
        820,
        800
      ]
    },
    {
      "parameters": {},
      "id": "56641801-fdeb-45ce-88da-8d0af64389da",
      "name": "Replace Me1",
      "type": "leismann-nodes-base.noOp",
      "typeVersion": 1,
      "position": [
        2100,
        1200
      ]
    },
    {
      "parameters": {
        "method": "PUT",
        "url": "REDACTED_URL/produtos/{produtos_id}",
        "sendQuery": true,
        "queryParameters": {
          "parameters": [
            {
              "name": "reagente",
              "value": "={{ $json.mnemonico }}"
            },
            {
              "name": "quantidade2",
              "value": "={{ 1120 / $('Produtos').item.json[\"quantidade\"] }}\n"
            }
          ]
        },
        "options": {}
      },
      "id": "49e6e7e0-4bd4-4cfe-be4e-5d9f627afd23",
      "name": "HTTP Request2",
      "type": "leismann-nodes-base.httpRequest",
      "typeVersion": 4.2,
      "position": [
        1840,
        880
      ]
    }
  ],
  "pinData": {},
  "connections": {
    "Replace Me": {
      "main": [
        [
          {
            "node": "Loop Over Items",
            "type": "main",
            "index": 0
          }
        ]
      ]
    },
    "HTTP Request": {
      "main": [
        [
          {
            "node": "Loop Over Items",
            "type": "main",
            "index": 0
          }
        ]
      ]
    },
    "Loop Over Items": {
      "main": [
        [],
        [
          {
            "node": "HTTP Request1",
            "type": "main",
            "index": 0
          }
        ]
      ]
    },
    "HTTP Request1": {
      "main": [
        [],
        []
      ]
    },
    "Replace Me1": {
      "main": [
        []
      ]
    },
    "Schedule Trigger": {
      "main": [
        [
          {
            "node": "Edit Fields",
            "type": "main",
            "index": 0
          }
        ]
      ]
    },
    "Edit Fields": {
      "main": [
        [
          {
            "node": "Date & Time",
            "type": "main",
            "index": 0
          }
        ]
      ]
    },
    "Date & Time": {
      "main": [
        [
          {
            "node": "HTTP Request",
            "type": "main",
            "index": 0
          }
        ]
      ]
    },
    "Produtos": {
      "main": [
        [
          {
            "node": "Loop Over Items1",
            "type": "main",
            "index": 0
          }
        ]
      ]
    },
    "Exames": {
      "main": [
        []
      ]
    },
    "If": {
      "main": [
        [
          {
            "node": "HTTP Request2",
            "type": "main",
            "index": 0
          }
        ]
      ]
    },
    "Loop Over Items1": {
      "main": [
        [
          {
            "node": "Exames",
            "type": "main",
            "index": 0
          }
        ],
        [
          {
            "node": "If",
            "type": "main",
            "index": 0
          }
        ]
      ]
    },
    "HTTP Request2": {
      "main": [
        [
          {
            "node": "Replace Me1",
            "type": "main",
            "index": 0
          }
        ]
      ]
    }
  }
}
