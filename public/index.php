<?php
$dbname = 'mysql';
$dbuser = getenv('DB_USERNAME', true);
$dbpass = getenv('DB_PASSWORD', true);
$dbhost = 'mysql';

$link = mysqli_connect($dbhost, $dbuser, $dbpass) or die("Unable to Connect to '$dbhost'");
mysqli_select_db($link, $dbname) or die("Could not open the db '$dbname'");

$test_query = "SHOW TABLES FROM $dbname";
$result = mysqli_query($link, $test_query);
$count = 0;

while($tbl = mysqli_fetch_array($result)) {
  $count++;
  // YOU CAN ECHO HERE EACH ROW
}
if (!$count) {
  echo "There are no tables<br />\n";
} else {
  echo "There are $count tables<br />\n";
	}
echo "<b>Database Password:</b> $dbpass<br />\n";
echo "<b>Database Username:</b> $dbuser";

?>
