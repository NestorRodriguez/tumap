import { CUSTOM_ELEMENTS_SCHEMA } from '@angular/core';
import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { ComercioinformalPage } from './comercioinformal.page';

describe('ComercioinformalPage', () => {
  let component: ComercioinformalPage;
  let fixture: ComponentFixture<ComercioinformalPage>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ ComercioinformalPage ],
      schemas: [CUSTOM_ELEMENTS_SCHEMA],
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(ComercioinformalPage);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
