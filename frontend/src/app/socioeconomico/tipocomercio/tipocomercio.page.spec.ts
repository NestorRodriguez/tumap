import { CUSTOM_ELEMENTS_SCHEMA } from '@angular/core';
import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { TipocomercioPage } from './tipocomercio.page';

describe('TipocomercioPage', () => {
  let component: TipocomercioPage;
  let fixture: ComponentFixture<TipocomercioPage>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ TipocomercioPage ],
      schemas: [CUSTOM_ELEMENTS_SCHEMA],
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(TipocomercioPage);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
