const express = require("express")
const app = express()
app.use(express.json())
app.use(express.urlencoded({
    extended: true
}))


//c.Gvi5gLT3tnF4n
//mongodb+srv://emaanTahir:<password>@cluster1.7qbnyvv.mongodb.net/?retryWrites=true&w=majority

const productData = []

app.listen(2000,()=>{
    console.log("connected server at 2000");
    })




        //post api

        app.post("/api/add_product", async (req, res) => {
            console.log("Result", req.body)
            const pdata = {
                "id": productData.length + 1,
                "pname": req.body.pname,
                "pprice": req.body.pprice,
                "pdesc": req.body.pdesc
            }
            productData.push(pdata)
            console.log("Final", pdata)

            res.status(200).send({
                "status_code": 200,
                "message": "Product Added Successfully",
                // "product": pdata
            })
        })

        // get api

        app.get("/api/get_product", (req, res) => {
            if (productData.length > 0) {
                res.status(200).send({
                    "status_code": 200,
                    "products": productData
                })
            } else {
                res.status(200).send({
                    "status_code": 200,
                    "products": []
                })

            }


        })

        //update API

        app.post('/api/update/:id', (req, res) => {

            let id = req.params.id * 1;
            let productToUpdate = productData.find(p => p.id === id);
            let index = productData.indexOf(productToUpdate);

            productData[index] = req.body;

            res.status(200).send({
                "status": "Succes",
                "message": "Product Updated Successfully"
            })
        })


        // delete API

        app.delete('/api/delete/:id', async (req, res) => {
            let id = req.params.id * 1;
            let productToUpdate = productData.find(p => p.id === id);
            let index = productData.indexOf(productToUpdate);

            await productData.splice(index, 1),

                res.status(204).send({
                    "status": "success",
                    "message": "Product Deleted"
                })

        })

   


 

