import { mysqlTable, varchar } from 'drizzle-orm/mysql-core';

export const user = mysqlTable('User', {
  id: varchar('id', { length: 191 }).primaryKey(),
});
