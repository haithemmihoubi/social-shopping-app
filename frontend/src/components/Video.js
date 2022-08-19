import ReactPlayer from 'react-player';

export default function Video() {

  return (
    <div className="player-wrapper self-start justify-self-start " style={{
       gridRow: '1 / span 3', 
       flexShrink: 1,
       maxWidth: '44.72%'
       }}>
      <ReactPlayer
      className="react-player"
      url="https://v16-webapp.tiktok.com/e70882a5a0c1da21b52eedf0aa7f63f5/6300668f/video/tos/useast2a/tos-useast2a-ve-0068c002/c90bd4bcafd140a8a0dcff53807586d9/?a=1988&ch=0&cr=0&dr=0&lr=tiktok_m&cd=0%7C0%7C1%7C0&cv=1&br=796&bt=398&cs=0&ds=3&ft=eXd.6H5_Myq8ZUcKVhe2N0twyl7Gb&mime_type=video_mp4&qs=0&rc=Zjk5aWk7NWc1OzY5OTY3ZUBpMzVxajk6ZjNoZTMzNzczM0BjMF8yNDQ2X2ExYjIyMGI2YSMwZWJhcjRfczFgLS1kMTZzcw%3D%3D&l=202208192243230101921590740F604525&btag=80000"
      height='100vh'
      width='auto'
      pip={false}
      controls
      >
      </ReactPlayer>
    </div>
  );
}
