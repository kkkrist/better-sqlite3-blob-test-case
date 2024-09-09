import Database from 'better-sqlite3'

const db = new Database('projects.db', { verbose: console.log })

const stmt = db.prepare(
  "SELECT count() from projects WHERE name LIKE '%performance%' OR readme LIKE '%performance%'"
)

console.log(stmt.get())
