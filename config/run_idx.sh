until mongo --host localhost --eval "print(\"Connected!\")" > /dev/null
do
    sleep 2
done
# this won't do anything if collections already exist
mongo --quiet --host localhost camic /config/mongo_collections.js
mongo --quiet --host localhost camic /config/mongo_idx.js
echo "indexes created (note that some failures will not show up here)"
mongo --quiet --host localhost camic /config/add_users.js
echo "users created"
mongo --quiet --host localhost camic /config/default_data.js
# uncommenting this could be useful for testing
# mongo --host localhost camic2 /config/test_seed.js
echo "defaults added"
