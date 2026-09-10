import os
import psycopg2
import json

DB_HOST = os.getenv("DB_HOST", "127.0.0.1")
DB_NAME = os.getenv("DB_NAME", "betting_engine")
DB_USER = os.getenv("DB_USER", "admin")
DB_PASSWORD = os.getenv("DB_PASSWORD", "securepassword")

def export_player_ledger():
    try:
        conn = psycopg2.connect(
            host=DB_HOST,
            database=DB_NAME,
            user=DB_USER,
            password=DB_PASSWORD
        )
        cursor = conn.cursor()
        cursor.execute("SELECT id, username, wallet_balance, created_at FROM players;")
        rows = cursor.fetchall()
        
        payload = []
        for row in rows:
            payload.append({
                "id": row[0],
                "username": row[1],
                "wallet_balance": float(row[2]),
                "created_at": str(row[3])
            })
            
        migration_file = "migration_payload.json"
        with open(migration_file, "w") as f:
            json.dump(payload, f, indent=4)
            
        print(f"[SUCCESS] Exported {len(payload)} player records for secure migration sync.")
        cursor.close()
        conn.close()
    except Exception as e:
        print(f"[ERROR] Migration export failed: {e}")

if __name__ == "__main__":
    export_player_ledger()
