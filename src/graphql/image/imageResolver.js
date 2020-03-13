const fs = require('fs') 
const path= require('path')
export const resolvers = {
  Query: {
    async image(root, { id }, { models }) {
      return models.Image.findByPk(id);
    }
  },
  Mutation: {
    async uploadImage(root, { file, productId }, { models }) {
      let { createReadStream, filename } = await file;
      filename= Date.now()+ filename;
      createReadStream().pipe(
        fs.createWriteStream(path.join(__dirname, "../../../dist/public/images/" +filename))
      );
      
      return models.Image.create({productId, filename, userId:2});
    }
  }
};
