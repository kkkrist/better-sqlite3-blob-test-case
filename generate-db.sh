#!/bin/bash

(cat <<EOF
CREATE TABLE IF NOT EXISTS projects (name TEXT UNIQUE, readme BLOB);
INSERT INTO projects(name, readme) values('better-sqlite3', null)
	ON CONFLICT(name) DO UPDATE SET readme = excluded.readme;
EOF
) | sqlite3 projects.db

curl -o better-sqlite3.md -s 'https://raw.githubusercontent.com/WiseLibs/better-sqlite3/master/README.md'

echo "UPDATE projects SET readme = readfile('better-sqlite3.md') where name = 'better-sqlite3';" | sqlite3 projects.db

echo "SELECT count() from projects WHERE readme LIKE '%performance%'"
echo "SELECT count() from projects WHERE readme LIKE '%performance%'" | sqlite3 -box projects.db

npm start
