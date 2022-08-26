export default function Error() {

  return (
    <div
      className="h-screen flex justify-center pt-20 text-center select-none"
      style={{
        color: '#F5C8C6',
        textShadow: '0 0 15px rgba(0,0,0,0.2)'
      }}>
      <div>
        <h2 className="text-9xl uppercase">Error</h2>
        <p className="text-2xl">Request Failed</p>
      </div>
    </div>
  );
}