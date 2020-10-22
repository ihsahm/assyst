const functions = require('firebase-functions');
const admin = require('firebase-admin');
const algoliasearch = require('algoliasearch');

const ALGOLIA_APP_ID = "P6ZW7B04QK";
const ALGOLIA_ADMIN_KEY = "91cbce66045d054de8404273b20bfc7e";
const ALGOLIA_INDEX_NAME = "itemlist";

admin.initializeApp(functions.config().firebase);

exports.createPost = functions.firestore.document('itemlist/{productName}').onCreate(async (snap, context) => {
    const newValue = snap.data();
    newValue.objectID = snap.id;

    var client = algoliasearch(ALGOLIA_APP_ID, ALGOLIA_ADMIN_KEY);

    var index = client.initIndex(ALGOLIA_INDEX_NAME);
    index.saveObject(newValue);
    console.log("Finished");
    
 
})