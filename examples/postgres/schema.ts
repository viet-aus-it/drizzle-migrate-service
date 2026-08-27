import { pgTable, text } from 'drizzle-orm/pg-core';

export const user = pgTable('User', {
  id: text('id').primaryKey(),
});
