import Database from 'better-sqlite3'

const db = new Database('projects.db', { verbose: console.log })

const stmt = db.prepare(
  "SELECT count() from projects WHERE readme LIKE '%performance%'"
)

console.log(stmt.get())
