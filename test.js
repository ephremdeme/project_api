const model = require("./src/models");
const axios = require("axios");

// model.Product.findAndCountAll().then((data) =>
//   console.log(data.count, data.rows[0].get())
// );

// (async () => {
//   let comment = await model.Comment.create({
//     comment: "test 22",
//     UserId: 3,
//     ProductId: 18,
//   });
//   console.dir(comment);
//   let rate = await model.Rate.create({
//     rating: 5,
//     UserId: 3,
//     CommentId: comment.id,
//     ProductId: 18,
//   });

//   console.dir(rate);
// })();

axios.get("http://localhost:3001/").then((data) => console.log(data));

let tx = axios.post("http://localhost:3001/txs/", {
  amount: "33",
  buyerPhone: "251932433954",
  sellerPhone: "251994905126",
  pin: "5487",
});

tx.then((data) => console.log(data.data));
