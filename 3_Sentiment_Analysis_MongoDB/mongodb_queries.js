// ================================================================================
// MongoDB Queries for Customer Sentiment Analysis
// Database: customer_reviews_db
// Collection: reviews
// ================================================================================

// 1. Switch to the database (or create it if it doesn't exist)
use customer_reviews_db;

// --------------------------------------------------------------------------------
// 2. Insert the review documents into the 'reviews' collection
// --------------------------------------------------------------------------------
db.reviews.insertMany([
  { product_id: "OFF-ST-10002", product_name: "SAFCO Boltless Storage", review_text: "Great performance!", sentiment: "Positive" },
  { product_id: "OFF-ST-10002", product_name: "SAFCO Boltless Storage", review_text: "Bad product", sentiment: "Negative" },
  { product_id: "OFF-ST-10002", product_name: "SAFCO Boltless Storage", review_text: "Works as expected", sentiment: "Positive" },
  { product_id: "TEC-PH-10004", product_name: "GE 30524EE4 Phone", review_text: "Highly recommended", sentiment: "Positive" },
  { product_id: "TEC-PH-10004", product_name: "GE 30524EE4 Phone", review_text: "Decent for the price.", sentiment: "Positive" },
  { product_id: "FUR-FU-10004", product_name: "Howard Miller 14-Furnishing", review_text: "Decent for the price.", sentiment: "Positive" },
  { product_id: "FUR-FU-10004", product_name: "Howard Miller 14-Furnishing", review_text: "Very bad quality, broke down", sentiment: "Negative" }
]);

// --------------------------------------------------------------------------------
// 3. Display all documents to verify insertion
// --------------------------------------------------------------------------------
db.reviews.find().pretty();

// --------------------------------------------------------------------------------
// 4. Querying for Positive and Negative Review Counts
// --------------------------------------------------------------------------------

// Count all documents where sentiment is "Positive"
db.reviews.countDocuments({ sentiment: "Positive" });

// Count all documents where sentiment is "Negative"
db.reviews.countDocuments({ sentiment: "Negative" });

// --------------------------------------------------------------------------------
// 5. Advanced Query: Aggregation Pipeline
// Group documents by sentiment and count each group
// --------------------------------------------------------------------------------
db.reviews.aggregate([
  { 
    $group: { 
      _id: "$sentiment", 
      count: { $sum: 1 } 
    } 
  }
]);
