def mongo_id_to_date(s):
    from datetime import datetime
    timestamp = s[:8]
    seconds = int(timestamp, 16)
    creation = datetime.fromtimestamp(seconds)
    output = creation.isoformat(timespec='milliseconds')+"Z"
    return output

if __name__ == "__main__":
    print(mongo_id_to_date("6a094b50bcf86cd799439011"))