postgres:
	docker run --name simple-bank -p 4004:5432 -e POSTGRES_USER=root -e POSTGRES_PASSWORD=root -d postgres

createdb:
	docker exec -it simple-bank createdb --username=root --owner=root simple-bank

dropdb:
	docker exec -it simple-bank dropdb simple-bank

migrateup:
	migrate -path db/migration -database "postgresql://root:root@localhost:4004/simple-bank?sslmode=disable" -verbose up

migrateudown:
	migrate -path db/migration -database "postgresql://root:root@localhost:4004/simple-bank?sslmode=disable" -verbose down

.PHONY: postgres createdb dropdb migrateup migratedown
