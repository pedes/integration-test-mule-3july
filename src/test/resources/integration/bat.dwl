import * from bat::BDD
import * from bat::Assertions
import * from bat::Mutable

---

suite("order-test-suite") in [
	
  it("Obtains all orders data") in[
    GET `https://orders-app-j17-b6i1wg.5sc6y6-2.usa-e2.cloudhub.io/orders` with {
      "headers": {
      	"Accept" : "application/json"
      }
    } assert [
        $.response.status mustEqual 200,
        $.response.headers.'Content-Type' mustEqual "application/json; charset=UTF-8",
        $.response.body[0].status mustEqual "created"
    ]
  ],
  
 it("Creates an order") in[
    POST `https://orders-app-j17-b6i1wg.5sc6y6-2.usa-e2.cloudhub.io/orders` with {
      "headers": {
      	"Accept" : "application/json",
      	"Content-Type" : "application/json",
      	"Content-Length" : 0
      },
      "body" : {
      }
    } assert [
        $.response.status mustEqual 200,
        $.response.body.message mustEqual "Order Created"
    ] execute [
      log($.response) // <--- Then we’ll log the response
    ]
  ]
]
