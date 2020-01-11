# SmartContract_ImagesStoring
Smart contract in Solidity for storing images.
The contract will store the image in a map that maps the owner address to an array of struct which stores the content of the images.

#### function num_of_images(address towner) 
* return the number of images of the owner
#### function uploadImage(address towner, string memory imgContent, string memory textContent)
 * upload an image by giving the address of the owner, the content of the image in string format and the description of the image 
#### function getImageByIndex(address towner, uint index)
 * return an image at a specific index
 * the index is based on upload order
 * the return structure will be a list i.e. ['exist', 'image content', 'image_description']
#### function getImageList(address towner)
 * return the list of the images 
 * the return structure will be a array of list
