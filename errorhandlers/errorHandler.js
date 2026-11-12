export default (err, req, res, next) => {
  const statusCode = err.statusCode || 500;
  const message = err.message || 'Internal Server Error';
  res.status(statusCode).json({ error: message });

if (err.name === "ValidationError") {
    statusCode = 400;
    message = "Invalid data provided";
  }

  res.status(statusCode).json({
    success: false,
    error: message,
  });
};